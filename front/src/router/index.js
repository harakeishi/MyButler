import Vue from 'vue'
import VueRouter from 'vue-router'
import Store from '@/store/index.js'
import Home from '../views/Home.vue'
import Login from '../views/login.vue'
import Signup from '../views/signup.vue'
import Search from '../views/search.vue'
import Newacquaintance from '../views/new_acquaintance.vue'
import AcquaintanceInfo from '../views/acquaintanceInfo.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    meta: {
      isPublic: true
    },
    component: Home
  },
  {
    path: '/login',
    name: 'login',
    meta: {
      isPublic: true
    },
    component: Login
  },
  {
    path: '/signup',
    name: 'signup',
    meta: {
      isPublic: true
    },
    component: Signup
  },
  {
    path: '/search',
    name: 'search',
    component: Search
  },
  {
    path: '/new_acquaintance',
    name: 'new_acquaintance',
    component: Newacquaintance
  },
  {
    path: '/acquaintanceInfo',
    name: 'acquaintanceInfo',
    component: AcquaintanceInfo
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
router.beforeEach((to, from, next) => {
  if (to.matched.some(page => page.meta.isPublic) || Store.state.userinfo.token) {
    next()
  } else {
    next('/')
  }
})
export default router
