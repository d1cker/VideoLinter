import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

Vue.prototype.$black_frames = 'Test'

new Vue({
  beforeCreate: function() {
    console.log(this.$black_frames)
  },
  render: h => h(App),
}).$mount('#app')