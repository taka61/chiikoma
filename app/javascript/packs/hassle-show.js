import Vue from 'vue'
import HassleShow from '../hassle-show.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal)
document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-show'
  const hassleShow = document.querySelector(selector)
  if (hassleShow) {
    new Vue({
      render: h => h(HassleShow)
    }).$mount(selector)
  }
})
