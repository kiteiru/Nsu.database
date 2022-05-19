<template>

  <div class="navbar"/>
  <el-menu
      class="el-menu-demo"
      mode="horizontal"
      background-color="#22c1c3"
      text-color="#ffffff"
      active-text-color="#ffffff"
  >
    <el-menu-item index="1"
                  @click="this.handle('Home Page')">
      Home
    </el-menu-item>

    <el-menu-item index="2"
                  @click="this.handle('Information Page')">
      About database
    </el-menu-item>

    <el-sub-menu index="3">
      <template #title>Tables</template>
      <el-menu-item v-for="tbl in this.allTables"
                    v-bind:key="tbl.name"
                    :index="'3-'+tbl.id"
                    @click="this.secondHandle(tbl.name, tbl.path)">
        {{ tbl.name }}
      </el-menu-item>
    </el-sub-menu>

    <el-sub-menu index="4">
      <template #title>Queries</template>
      <el-menu-item v-for="qrs in this.allQueries"
                    v-bind:key="qrs.name"
                    :index="'4-'+qrs.id"
                    @click="this.secondHandle(qrs.name, qrs.path)">
        {{ qrs.name }}
      </el-menu-item>
    </el-sub-menu>
  </el-menu>
</template>

<script>
import tables from "@/data/tables";
import queries from "@/data/queries"
import {ref} from "vue";

export default {
  name: "NavbarMenu",
  methods: {
    handle(name) {
      this.$router.push({name: name})
    },
    secondHandle(name, path) {
      this.$router.push({
        name: name,
        params: {
          link: path,
          name: name
        }})
    }
  },
  setup() {
    const allTables = ref(tables)
    const allQueries = ref(queries)
    return {allTables, allQueries}
  }
}
</script>

<style scoped>

</style>