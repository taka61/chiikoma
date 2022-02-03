import Vue from 'vue'
import ChiikomaEdit from '../chiikoma-edit.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikoma-edit'
  const chiikomaEdit = document.querySelector(selector)
  if (chiikomaEdit) {
    new Vue({
      render: h => h(ChiikomaEdit)
    }).$mount(selector)
  }
})
