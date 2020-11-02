import request from '@/utils/request'

// 查询商品管理列表
export function listProductTool(query) {
  return request({
    url: '/system/productTool/list',
    method: 'get',
    params: query
  })
}

// 查询商品管理详细
export function getProductTool(productId) {
  return request({
    url: '/system/productTool/' + productId,
    method: 'get'
  })
}

// 新增商品管理
export function addProductTool(data) {
  return request({
    url: '/system/productTool',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateProductTool(data) {
  return request({
    url: '/system/productTool',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delProductTool(productId) {
  return request({
    url: '/system/productTool/' + productId,
    method: 'delete'
  })
}

// 导出商品管理
export function exportProductTool(query) {
  return request({
    url: '/system/productTool/export',
    method: 'get',
    params: query
  })
}
