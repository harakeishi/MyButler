<template>
  <div class="acquaintanceInfo">
    <div class="basicData">
      <h1>基本データ</h1>
      <el-row :gutter="20">
        <el-col :span="9"><div class="grid-content bg-purple">名前：</div></el-col>
        <el-col :span="9"><div class="grid-content bg-purple">{{info.name}}</div></el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="9"><div class="grid-content bg-purple">あだ名：</div></el-col>
        <el-col :span="9"><div class="grid-content bg-purple">{{info.nickname}}</div></el-col>
      </el-row>
    </div>
  </div>
</template>

<script>

export default {
  name: 'acquaintanceInfo',
  data () {
    return {
      info: this.$store.state.acquser
    }
  },
  components: {
  }
}
</script>
<style scoped>
  .basicData{
    width: 70%;
    margin: 2vh auto;
    border-radius: 10px;
    padding: 5px 10px;
    background-color: rgb(184, 255, 238);
  }
</style>
