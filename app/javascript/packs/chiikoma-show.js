import Vue from 'vue'
import ChiikomaShow from '../chiikoma-show.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikoma-show'
  const chiikomaShow = document.querySelector(selector)
  if (chiikomaShow) {
    new Vue({
      render: h => h(ChiikomaShow)
    }).$mount(selector)
  }
})
