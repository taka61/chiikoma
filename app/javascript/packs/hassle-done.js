import Vue from 'vue'
import HassleDone from '../hassle-done.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-done'
  const hassleDone = document.querySelector(selector)
  if (hassleDone) {
    new Vue({
      render: h => h(HassleDone)
    }).$mount(selector)
  }
})
