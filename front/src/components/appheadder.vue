<template>
  <div class="appheadder">
    <router-link to="/" class="title">プロジェクト名</router-link>
    <div class="menu">
      <ul id="nav">
        <span v-if="!$store.state.token">
          <li><router-link to="/login">ログイン</router-link></li>
          <li><router-link to="/signup">新規登録</router-link></li>
        </span>
        <span v-else>
          <li><router-link to="/login">検索</router-link></li>
          <li><router-link to="/about">マイページ</router-link></li>
        </span>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'appheadder'
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

#nav li a {
  text-decoration: none;
  color: #fff;
  font-weight: bold;
}

</style>
