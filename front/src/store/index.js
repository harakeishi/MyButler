import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: ''
  },
  mutations: {
    RegistrationToken (state, payload) {
      state.token = payload.token
    }
  },
  actions: {
    doRegistrationToken ({ commit }, token) {
      commit('RegistrationToken', { token })
    }
  },
  modules: {
  }
})
