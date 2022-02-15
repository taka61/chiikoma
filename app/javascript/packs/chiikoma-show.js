import Vue from 'vue'
import ChiikomaShow from '../chiikoma-show.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal)
document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikoma-show'
  const chiikomaShow = document.querySelector(selector)
  if (chiikomaShow) {
    new Vue({
      render: h => h(ChiikomaShow)
    }).$mount(selector)
  }
})
