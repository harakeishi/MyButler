<template>
  <div id="app">
    <Appheadder/>
    <router-view/>
  </div>
</template>

<script>
import Appheadder from './components/appheadder.vue'
export default {
  name: 'Home',
  components: {
    Appheadder
  }
}
</script>

<style>
*{
margin: 0;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
