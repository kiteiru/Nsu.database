<template>
  <div>
    <h1>{{ this.name }}</h1>
    <el-select-v2
        class="selectDropdown"
        v-model="this.params.organisationIdParam"
        :options="this.allOrganisationOptions"
        placeholder="Select Organisation"
    />

    <el-select-v2
        class="selectDropdown"
        v-model="this.params.managementIdParam"
        :options="this.allManagementOptions"
        placeholder="Select Management"
    />

    <el-select-v2
        class="selectDropdown"
        v-model="this.params.siteIdParam"
        :options="this.allSiteOptions"
        placeholder="Select Site"
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
import {ref} from "vue";
import {managementIdParamOptions, organisationIdParamOptions, siteIdParamOptions} from "@/data/parameters";

export default {
  name: "MaterialOverEstimateListQuery",
  props: {
    link: String,
    name: String
  },
  data() {
    return {
      params: {
        siteIdParam: null,
        managementIdParam: null,
        organisationIdParam: null
      },
      tableData: {}
    }
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
    const allSiteOptions = ref(siteIdParamOptions)
    const allManagementOptions = ref(managementIdParamOptions)
    const allOrganisationOptions = ref(organisationIdParamOptions)
    return {allSiteOptions, allManagementOptions, allOrganisationOptions}
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
  margin-bottom: 30px;
}

h1 {
  position: center;
  font-size: 50px;
  font-family: "Akshar";
}
</style>