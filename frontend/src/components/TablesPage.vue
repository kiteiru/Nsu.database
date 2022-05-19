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
import axios from "axios";

function toCapitalizedWords(name) {
  const words = name.match(/[A-Za-z][a-z]*/g) || [];

  return words.map(capitalize).join(" ");
}

function capitalize(word) {
  return word.charAt(0).toUpperCase() + word.substring(1);
}

export default {
  props: {
    link: String,
    name: String
  },
  name: "TablesPage",
  data() {
    return {
      tableData: {}
    }
  },
  mounted() {
    this.getTable()
  },
  methods: {
    async getTable() {
      try {
        const response = await axios.get(this.link)
        let rows = response.data
        let columns = []
        for (const key in rows[0]) {
          let obj = {field: key, headerName: toCapitalizedWords(key)}
          columns.push(obj);
        }
        this.tableData = {columns, rows}
      } catch (e) {
        console.log(e);
      }
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