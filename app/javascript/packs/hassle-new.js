import Vue from 'vue'
import HassleNew from '../hassle-new.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-new'
  const hassleNew = document.querySelector(selector)
  if (hassleNew) {
    new Vue({
      render: h => h(HassleNew)
    }).$mount(selector)
  }
})
