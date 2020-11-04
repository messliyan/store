package com.store.system.controller.web;

import com.store.common.core.domain.AjaxResult;
import com.store.common.core.domain.StoreResult;
import com.store.system.domain.Carousel;
import com.store.system.domain.Product;
import com.store.system.domain.WebCarousel;
import com.store.system.domain.WebProduct;
import com.store.system.service.ICarouselService;
import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 验证码操作处理
 *
 * @author store
 */
@RestController
public class WEBCarouselController
{
    @Value("${server.port}")
    private int port;

    @Autowired
    private ICarouselService carouselService;
    /**
     * 返回轮播图
     */
    @PostMapping("/res/carousel")
    public StoreResult getCode(HttpServletResponse response) throws IOException
    {
        ArrayList hashMaps=new ArrayList<WebProduct>();

        List<Carousel> list = carouselService.selectCarouselList(new Carousel());

        String IP = InetAddress.getLocalHost().getHostAddress();
        list.forEach(carousel -> {hashMaps.add(new WebCarousel(carousel.getCarouselId(), "http://"+IP+":"+port+"/"+carousel.getImgpath(),carousel.getDescribes()));
        });

        return StoreResult.success("获取首页展示的商品信息成功！","carousel",hashMaps);
    }
}
