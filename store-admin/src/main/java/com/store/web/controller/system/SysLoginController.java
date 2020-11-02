package com.store.web.controller.system;

import com.store.common.annotation.Log;
import com.store.common.constant.UserConstants;
import com.store.common.core.domain.StoreResult;
import com.store.common.enums.BusinessType;
import com.store.common.utils.SecurityUtils;
import com.store.system.service.ISysUserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.store.common.constant.Constants;
import com.store.common.core.domain.AjaxResult;
import com.store.common.core.domain.entity.SysMenu;
import com.store.common.core.domain.entity.SysUser;
import com.store.common.core.domain.model.LoginBody;
import com.store.common.core.domain.model.LoginUser;
import com.store.common.utils.ServletUtils;
import com.store.framework.web.service.SysLoginService;
import com.store.framework.web.service.SysPermissionService;
import com.store.framework.web.service.TokenService;
import com.store.system.service.ISysMenuService;

/**
 * 登录验证
 *
 * @author store
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysUserService userService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        java.lang.String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * web的登录
     */
    @Log(title = "")
    @PostMapping("/users/login")
    public StoreResult weblogin(@Validated @RequestBody SysUser user)
    {
        HashMap map = new HashMap();
        // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName())))
        {
            SysUser user1=userService.selectUserByUserName(user.getUserName());
            if (!SecurityUtils.matchesPassword(user.getPassword(),user1.getPassword()))
                return StoreResult.error("用户'" + user.getUserName() + "'用户名或密码错误！");
            map.put("user_id",user1.getUserId());
            map.put("userName",user1.getUserName());
            return StoreResult.success("用户'" + user.getUserName() + "'登陆成功！","user",map);
        }
        return StoreResult.error("用户'" + user.getUserName() + "'不存在");
    }
    /**
     * 检查用户是否已经存在
     */
    @Log(title = "检查用户是否已经存在")
    @PostMapping("/users/findUserName")
    public StoreResult findUserName(@Validated @RequestBody SysUser user)
    {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName())))
        {
            return StoreResult.error("新增用户'" + user.getUserName() + "'已经存在，不能注册");
        }

        return StoreResult.success("新增用户'" + user.getUserName() + "'不存在，可以注册");
    }

    /**
     * 注册用户
     */
    @Log(title = "注册用户")
    @PostMapping("/users/register")
    public StoreResult register(@Validated @RequestBody SysUser user)
    {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName())))
        {
            return StoreResult.error("新增用户'" + user.getUserName() + "'已经存在，不能注册");
        }
        user.setDeptId(Long.valueOf("108"));

        user.setPhonenumber("12345");
        user.setEmail("qq@qq.com");
        user.setSex("0");
        user.setStatus("0");
        user.setPostIds(new long[]{Long.valueOf("4")});
        user.setRoleIds(new long[]{Long.valueOf("2")});
        user.setNickName(user.getUserName());
        user.setCreateBy("store用户");
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return userService.insertUser(user) > 0 ? StoreResult.success() : StoreResult.error();
    }
    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<java.lang.String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        // 用户信息
        SysUser user = loginUser.getUser();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(user.getUserId());
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
