import Vue from 'vue'
import HassleEdit from '../hassle-edit.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-edit'
  const hassleEdit = document.querySelector(selector)
  if (hassleEdit) {
    new Vue({
      render: h => h(HassleEdit)
    }).$mount(selector)
  }
})
