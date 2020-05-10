<template>
  <div class="appheadder">
    <router-link to="/" class="title">私の執事</router-link>
    <div class="menu">
      <ul id="nav">
        <span v-if="!$store.state.userinfo.token">
          <router-link to="/login"><li>ログイン</li></router-link>
          <router-link to="/signup"><li>新規登録</li></router-link>
        </span>
        <span v-else>
          <router-link to="/search"><li>検索</li></router-link>
          <a @click="dologout"><li>ログアウト</li></a>
        </span>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'appheadder',
  methods: {
    dologout () {
      this.$store.dispatch('doRegistrationToken', null)
      this.$router.push('/')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.appheadder{
  background-color: rgb(92, 182, 153);
  height: 50px;
}
.menu{
  text-align: right;
  float: right;
  position:  fixed;
  right: 0;
  top: 0;
}
.title{
  font-size: 40px;
  text-align: center;
  margin: auto;
  text-decoration: none;
  color: rgb(0, 0, 0);
  font-weight: bold;
}
#nav {
  padding: 0 0 0 0;
  list-style: none;
  overflow: hidden;
  display: inline;
}

#nav li {
  width: 12vw;
  text-align: center;
  background-color: #333;
  float: left;
  height: 50px;
  line-height: 50px;
  margin-right: 2px;
}

#nav li {
  text-decoration: none;
  color: #fff;
  font-weight: bold;
}

</style>
