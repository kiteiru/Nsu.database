<template>
  <div>
    <h1>{{ this.name }}</h1>
    <el-table :data="tableData.rows" style="width: 100%">
      <el-table-column v-for="column in this.tableData.columns"
                       v-bind:key="column.field" :prop="column.field" :label="column.headerName"/>

    </el-table>
  </div>
</template>

<script>
import {getTableForQuery} from "@/getTableForQuery";

export default {
  name: "ManagementListQuery",
  props: {
    link: String,
    name: String
  },
  data() {
    return {tableData: {}}
  },
  mounted() {
    this.updateData()
  },
  methods: {
    updateData() {
      getTableForQuery(this.link, {}).then((ret) => { this.tableData = ret})
    }
  }
}
</script>

<style scoped>
h1 {
  position: center;
  font-size: 50px;
  font-family: "Akshar";
}
</style>