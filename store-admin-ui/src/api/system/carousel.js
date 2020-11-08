import request from '@/utils/request'

// 查询轮播图片管理列表
export function listCarousel(query) {
  return request({
    url: '/system/carousel/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图片管理详细
export function getCarousel(carouselId) {
  return request({
    url: '/system/carousel/' + carouselId,
    method: 'get'
  })
}

// 新增轮播图片管理
export function addCarousel(data) {
  return request({
    url: '/system/carousel',
    method: 'post',
    data: data
  })
}

// 修改轮播图片管理
export function updateCarousel(data) {
  return request({
    url: '/system/carousel',
    method: 'put',
    data: data
  })
}

// 删除轮播图片管理
export function delCarousel(carouselId) {
  return request({
    url: '/system/carousel/' + carouselId,
    method: 'delete'
  })
}

// 导出轮播图片管理
export function exportCarousel(query) {
  return request({
    url: '/system/carousel/export',
    method: 'get',
    params: query
  })
}