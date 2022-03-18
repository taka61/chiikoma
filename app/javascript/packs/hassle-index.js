import Vue from 'vue'
import HassleIndex from '../hassle-index.vue'
import VueCookies from 'vue-cookies'
import VModal from 'vue-js-modal'

Vue.use(VueCookies)
Vue.use(VModal)
document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-index'
  const hassleIndex = document.querySelector(selector)
  if (hassleIndex) {
    new Vue({
      render: h => h(HassleIndex)
    }).$mount(selector)
  }
})
