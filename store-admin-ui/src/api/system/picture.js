import request from '@/utils/request'

// 查询产品详细管理列表
export function listPicture(query) {
  return request({
    url: '/system/picture/list',
    method: 'get',
    params: query
  })
}

// 查询产品详细管理详细
export function getPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'get'
  })
}

// 新增产品详细管理
export function addPicture(data) {
  return request({
    url: '/system/picture',
    method: 'post',
    data: data
  })
}

// 修改产品详细管理
export function updatePicture(data) {
  return request({
    url: '/system/picture',
    method: 'put',
    data: data
  })
}

// 删除产品详细管理
export function delPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'delete'
  })
}

// 导出产品详细管理
export function exportPicture(query) {
  return request({
    url: '/system/picture/export',
    method: 'get',
    params: query
  })
}