import Vue from 'vue'
import ChiikomaDone from '../chiikoma-done.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikoma-done'
  const chiikomaDone = document.querySelector(selector)
  if (chiikomaDone) {
    new Vue({
      render: h => h(ChiikomaDone)
    }).$mount(selector)
  }
})
