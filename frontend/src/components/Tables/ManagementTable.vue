<template>
  <div>
    <h1>{{ this.name }}</h1>

    <div class="createForm">
      <el-form :model="form">
        <el-form-item label="Management name">
          <el-input v-model="form.name" />
        </el-form-item>

        <el-form-item label="Organisation name">
          <el-select-v2
              class="selectDropdown"
              v-model="form.organisation.id"
              :options="this.allOrganisationOptions"
              placeholder="Select Organisation"
          />
        </el-form-item>

        <el-form-item>
          <el-button class="submit" type="success" round @click="createEntity">Create</el-button>

        </el-form-item>
      </el-form>
    </div>


    <el-table :data="tableData.rows" style="width: 100%">
      <el-table-column v-for="column in this.tableData.columns"
                       v-bind:key="column.field" :prop="column.field" :label="column.headerName"/>
      <el-table-column label="Delete Record">
        <template #default="scope">
          <el-button type="danger" round  v-on:click="deleteEntity(scope.$index)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import {getTableRecords} from "@/getTableRecords";
import {ElMessage, ElMessageBox} from "element-plus";
import axios from "axios";
import {reactive, ref} from "vue";
import {organisationIdParamOptions} from "@/data/parameters";

export default {
  name: "ManagementTable",
  props: {
    link: String,
    name: String
  },
  data() {
    return {
      tableData: {},
      form: reactive({
        name: '',
        organisation: {id: ''}
      }),
      params: {organisationIdParam: ''},
    }
  },
  mounted() {
    this.getTable()
  },
  methods: {
    getTable() {
      getTableRecords(this.link, null).then((ret) => { this.tableData = ret})
    },
    async deleteEntity(idx) {
      let id = this.tableData.rows[idx].id
      if (await ElMessageBox.confirm("Do you really want to delete this record?",
          'Warning',
          {
            confirmButtonText: 'OK',
            cancelButtonText: 'Cancel',
            type: 'warning',
          })) {
        try {
          await axios.delete(this.link + "/" + id)
          this.tableData.rows.splice(idx, 1)
          ElMessage({
            type: 'success',
            message: 'Successfully deleted',
          })
        } catch (e) {
          console.log(e);
          ElMessage({
            type: 'info',
            message: 'Unsuccessfully deleted',
          });
        }
      }
    },
    async createEntity() {
      try {
        await axios.post(this.link, this.form)
        this.getTable()
      } catch (e) {
        console.log(e);
      }
    }
  },
  setup() {
    const allOrganisationOptions = ref(organisationIdParamOptions)
    return {allOrganisationOptions}
  }
}
</script>

<style scoped>
.createForm {
  width: 520px;
  margin-left: 35%;
  border: 2px solid #22c0c2;
  border-radius: 20px;
  padding: 30px 30px 15px;
  margin-bottom: 30px;
}
</style>