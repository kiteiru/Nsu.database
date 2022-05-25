<template>
  <div>
    <h1>{{ this.name }}</h1>
    <div class="all">
      <div class="selectDropdown">
        <el-select-v2
            v-model="this.params.brigadeIdParam"
            :options="this.allBrigadeOptions"
            placeholder="Select Brigade"
        />
      </div>

      <div class="date">
        <el-date-picker v-model="this.params.startDateParam"
                        type="date"
                        placeholder="Pick Start Date"
                        format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD"/>
      </div>

      <div class="date">
        <el-date-picker v-model="this.params.endDateParam"
                        type="date"
                        placeholder="Pick End Date"
                        format="YYYY/MM/DD"
                        value-format="YYYY-MM-DD"/>
      </div>

      <div class="selectDropdown">
        <el-select-v2
            v-model="this.params.objectIdParam"
            :options="this.allObjectOptions"
            placeholder="Select Object"
        />
      </div>
      <el-button class="submit" type="success" round @click="this.updateData()">Submit</el-button>
    </div>
    <el-table :data="tableData.rows" style="width: 100%">
      <el-table-column v-for="column in this.tableData.columns"
                       v-bind:key="column.field" :prop="column.field" :label="column.headerName"/>
    </el-table>
  </div>
</template>

<script>
import {getTableRecords} from "@/getTableRecords";
import {brigadeIdParamOptions, objectIdParamOptions} from "@/data/parameters";
import {ref} from "vue";

export default {
  name: "WorkTypeByBrigadeInPeriodListQuery",
  props: {
    link: String,
    name: String
  },
  data() {
    return {
      params: {
        brigadeIdParam: null,
        startDateParam: null,
        endDateParam: null,
        objectIdParam: null
      },
      tableData: {}}
  },
  mounted() {
    this.updateData()
  },
  methods: {
    updateData() {
      console.log(this.params.startDateParam)
      console.log(this.params.endDateParam)
      getTableRecords(this.link, this.params).then((ret) => { this.tableData = ret})
    }
  },
  setup() {
    const allBrigadeOptions = ref(brigadeIdParamOptions)
    const allObjectOptions = ref(objectIdParamOptions)
    return {allBrigadeOptions, allObjectOptions}
  }
}
</script>

<style scoped>
.submit {
  margin-left: 20px;
  margin-bottom: 30px;
}

.selectDropdown {
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 30px;
}

.date {
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 30px;
}

.all {
  display: inline-flex;
}

h1 {
  position: center;
  font-size: 50px;
  font-family: "Akshar";
}
</style>