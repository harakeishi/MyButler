import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userinfo: '',
    acquser: ''
  },
  mutations: {
    RegistrationToken (state, payload) {
      state.userinfo = payload.userinfo
    },
    RegistrationAcqUser (state, payload) {
      state.acquser = payload.acquserinfo
    }
  },
  actions: {
    doRegistrationToken ({ commit }, userinfo) {
      commit('RegistrationToken', { userinfo })
    },
    doRegistrationAcqUser ({ commit }, acquserinfo) {
      commit('RegistrationAcqUser', { acquserinfo })
    }
  },
  modules: {
  }
})
