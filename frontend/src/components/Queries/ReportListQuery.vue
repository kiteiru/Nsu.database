<template>
  <div>
    <h1>{{ this.name }}</h1>
    <el-select-v2
        class="selectDropdown"
        v-model="this.params.objectIdParam"
        :options="this.allObjectOptions"
        placeholder="Select Object"
    />
    <el-button class="submit" type="success" round @click="this.updateData()">Submit</el-button>
    <el-table :data="tableData.rows" style="width: 100%">
      <el-table-column v-for="column in this.tableData.columns"
                       v-bind:key="column.field" :prop="column.field" :label="column.headerName"/>

    </el-table>
  </div>
</template>

<script>
import {getTableRecords} from "@/getTableRecords";
import {objectIdParamOptions} from "@/data/parameters";
import {ref} from "vue";
export default {
  name: "ReportListQuery",
  props: {
    link: String,
    name: String
  },
  data() {
    return {params: {objectIdParam: null}, tableData: {}}
  },
  mounted() {
    this.updateData()
  },
  methods: {
    updateData() {
      getTableRecords(this.link, this.params).then((ret) => { this.tableData = ret})
    }
  },
  setup() {
    const allObjectOptions = ref(objectIdParamOptions)
    return {allObjectOptions}
  }
}
</script>

<style scoped>
.submit {
  margin-left: 20px;
  margin-bottom: 30px;
}

.selectDropdown {
  margin-bottom: 30px;
}

h1 {
  position: center;
  font-size: 50px;
  font-family: "Akshar";
}
</style>