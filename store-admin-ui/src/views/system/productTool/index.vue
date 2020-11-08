<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商品名称" prop="productName">
        <el-input
          v-model="queryParams.productName"
          placeholder="请输入商品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品分类" prop="categoryId">
        <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入商品分类"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品标题" prop="productTitle">
        <el-input
          v-model="queryParams.productTitle"
          placeholder="请输入商品标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="商品介绍" prop="productIntro">-->
<!--        <el-input-->
<!--          v-model="queryParams.productIntro"-->
<!--          placeholder="请输入商品介绍"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品照片地址" prop="productPicture">-->
<!--        <el-input-->
<!--          v-model="queryParams.productPicture"-->
<!--          placeholder="请输入商品照片地址"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品价格" prop="productPrice">-->
<!--        <el-input-->
<!--          v-model="queryParams.productPrice"-->
<!--          placeholder="请输入商品价格"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="销售价格" prop="productSellingPrice">-->
<!--        <el-input-->
<!--          v-model="queryParams.productSellingPrice"-->
<!--          placeholder="请输入销售价格"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="数量" prop="productNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.productNum"-->
<!--          placeholder="请输入数量"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="销售量" prop="productSales">-->
<!--        <el-input-->
<!--          v-model="queryParams.productSales"-->
<!--          placeholder="请输入销售量"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:productTool:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:productTool:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:productTool:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:productTool:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="productToolList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="商品id" align="center" prop="productId" />
      <el-table-column label="商品名称" align="center" prop="productName" />
      <el-table-column label="商品分类" align="center" prop="categoryId" :formatter="categoryIdFormat" />
      <el-table-column label="商品标题" align="center" prop="productTitle" />
<!--      <el-table-column label="商品介绍" align="center" prop="productIntro" />-->
      <el-table-column  label="商品照片地址" align="center" prop="productPicture" >
        <template slot-scope="scope">
          <el-image :src="scope.row.productPicture">
          </el-image>
        </template>
      </el-table-column>
      <el-table-column label="商品价格" align="center" prop="productPrice" />
      <el-table-column label="销售价格" align="center" prop="productSellingPrice" />
      <el-table-column label="数量" align="center" prop="productNum" />
      <el-table-column label="销售量" align="center" prop="productSales" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:productTool:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:productTool:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="商品名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品分类" prop="categoryId">
          <el-input v-model="form.categoryId" placeholder="请输入商品分类" />
        </el-form-item>
        <el-form-item label="商品标题" prop="productTitle">
          <el-input v-model="form.productTitle" placeholder="请输入商品标题" />
        </el-form-item>
        <el-form-item label="商品介绍" prop="productIntro">
          <el-input v-model="form.productIntro" type="textarea" placeholder="请输入商品介绍"
                    :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
        </el-form-item>
        <el-form-item label="商品照片地址" prop="productPicture">
          <el-input v-model="form.productPicture" placeholder="请输入商品照片地址" />
        </el-form-item>
        <el-form-item label="商品价格" prop="productPrice">
          <el-input v-model="form.productPrice" placeholder="请输入商品价格" />
        </el-form-item>
        <el-form-item label="销售价格" prop="productSellingPrice">
          <el-input v-model="form.productSellingPrice" placeholder="请输入销售价格" />
        </el-form-item>
        <el-form-item label="数量" prop="productNum">
          <el-input v-model="form.productNum" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="销售量" prop="productSales">
          <el-input v-model="form.productSales" placeholder="请输入销售量" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listProductTool, getProductTool, delProductTool, addProductTool, updateProductTool, exportProductTool } from "@/api/system/productTool";
export default {
  name: "ProductTool",
  data() {
    return {
      // 遮罩层
      loading: true,

      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 商品管理表格数据
      productToolList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 商品分类字典
      categoryIdOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productName: null,
        categoryId: null,
        productTitle: null,
        productIntro: null,
        productPicture: null,
        productPrice: null,
        productSellingPrice: null,
        productNum: null,
        productSales: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productName: [
          { required: true, message: "商品名称不能为空", trigger: "blur" }
        ],
        categoryId: [
          { required: true, message: "商品分类不能为空", trigger: "blur" }
        ],
        productTitle: [
          { required: true, message: "商品标题不能为空", trigger: "blur" }
        ],
        productIntro: [
          { required: true, message: "商品介绍不能为空", trigger: "blur" }
        ],
        productPrice: [
          { required: true, message: "商品价格不能为空", trigger: "blur" }
        ],
        productSellingPrice: [
          { required: true, message: "销售价格不能为空", trigger: "blur" }
        ],
        productNum: [
          { required: true, message: "数量不能为空", trigger: "blur" }
        ],
        productSales: [
          { required: true, message: "销售量不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("web_category_type").then(response => {
      this.categoryIdOptions = response.data;
    });
  },
  computed : {
    productImg: function (productPicture ) {
      // `this` 指向 vm 实例
      return 'http://localhost:8088/public/imgs/appliance/MiTv-4A-32.png'
    }
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listProductTool(this.queryParams).then(response => {
        this.productToolList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 商品分类字典翻译
    categoryIdFormat(row, column) {
      return this.selectDictLabel(this.categoryIdOptions, row.categoryId);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        productId: null,
        productName: null,
        categoryId: null,
        productTitle: null,
        productIntro: null,
        productPicture: null,
        productPrice: null,
        productSellingPrice: null,
        productNum: null,
        productSales: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.productId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加商品管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const productId = row.productId || this.ids
      getProductTool(productId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.productId != null) {
            updateProductTool(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProductTool(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const productIds = row.productId || this.ids;
      this.$confirm('是否确认删除商品管理编号为"' + productIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delProductTool(productIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有商品管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportProductTool(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
