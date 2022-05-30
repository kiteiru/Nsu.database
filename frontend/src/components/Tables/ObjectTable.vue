<template>
  <div>
    <h1>{{ this.name }}</h1>

    <div class="createForm">
      <el-form :model="form">
        <el-form-item label="Object name">
          <el-input v-model="form.name" placeholder="Object Name"/>
        </el-form-item>

        <el-form-item label="Site name">
          <el-select-v2
              class="selectDropdown"
              v-model="form.site.id"
              :options="this.allSiteOptions"
              placeholder="Select Site"
          />
        </el-form-item>

        <el-form-item label="Object type">
          <el-select-v2
              class="selectDropdown"
              v-model="objectType"
              :options="this.allObjectTypesOptions"
              placeholder="Select Object Type"
          />
        </el-form-item>

        <el-form-item v-if="objectType === 'buildingType'" label="Building Type">
          <el-select-v2
              class="selectDropdown"
              v-model="buildingType"
              :options="this.allBuildingTypesOptions"
              placeholder="Select Building Type"
          />
        </el-form-item>

        <el-form-item v-if="objectType === 'buildingType'" label="Floor Number">
          <el-input v-model="formBuildingType.floorNum" placeholder="Floor Number"/>
        </el-form-item>

        <el-form-item v-if="objectType === 'buildingType'" label="Area">
          <el-input v-model="formBuildingType.area" placeholder="Area"/>
        </el-form-item>

        <el-form-item v-if="buildingType === 'residential' && objectType === 'buildingType'" label="Flat Number">
          <el-input v-model="formResidential.flatNum" placeholder="Flat Number"/>
        </el-form-item>
        


        <el-form-item v-if="objectType === 'pathType'" label="Path Type">
          <el-select-v2
              class="selectDropdown"
              v-model="pathType"
              :options="this.allPathTypesOptions"
              placeholder="Select Path Type"
          />
        </el-form-item>

        <el-form-item v-if="objectType === 'pathType'" label="Lane Number">
          <el-input v-model="formPathType.laneNum" placeholder="Lane Number"/>
        </el-form-item>

        <el-form-item v-if="objectType === 'pathType'" label="Width">
          <el-input v-model="formPathType.width" placeholder="Width"/>
        </el-form-item>

        <el-form-item v-if="objectType === 'pathType'" label="Length">
          <el-input v-model="formPathType.length" placeholder="Length"/>
        </el-form-item>

        <el-form-item v-if="pathType === 'bridge' && objectType === 'pathType'" label="Span Type">
          <el-input v-model="formBridge.spanType" placeholder="Span Type"/>
        </el-form-item>

        <el-form-item>
          <el-button class="submit" type="success" round @click="createObjectEntity">Create</el-button>
        </el-form-item>
      </el-form>
    </div>

    <el-table :data="tableData.rows" style="width: 100%">
      <el-table-column v-for="column in this.tableData.columns"
                       v-bind:key="column.field" :prop="column.field" :label="column.headerName"/>
      <el-table-column label="Delete Record">
        <template #default="scope">
          <el-button type="danger" round  v-on:click="deleteObjectEntity(scope.$index)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import {getTableRecords} from "@/getTableRecords";
import {ElMessage, ElMessageBox} from "element-plus";
import axios from "axios";
import {reactive} from "vue";
import {
  buildingTypesParamOptions,
  objectIdParamOptions,
  objectTypesParamOptions, pathTypesParamOptions,
  siteIdParamOptions
} from "@/data/parameters";
import {ref} from "vue";


export default {
  name: "ObjectTable",
  props: {
    link: String,
    name: String
  },
  data() {
    return {
      tableData: {},
      form: reactive({
        name: '',
        site: {id: ''},
      }),
      objectType: '',
      buildingType: '',
      pathType: '',
      formBuildingType: reactive({
        object: {id: ''},
        floorNum: null,
        area: null
      }),
      formResidential: reactive({
        object: {id: ''},
        flatNum: null
      }),
      formNonresidential: reactive({
        object: {id: ''},
      }),
      formPathType: reactive({
        object: {id: ''},
        laneNum: null,
        width: null,
        length: null
      }),
      formBridge: reactive({
        object: {id: ''},
        spanType: 'smth'
      }),
      formRoad: reactive({
        object: {id: ''}
      }),
      params: {siteIdParam: ''},
    }
  },
  mounted() {
    this.getTable()
  },
  methods: {
    getTable() {
      getTableRecords(this.link, null).then((ret) => { this.tableData = ret})
    },
    async deleteObjectEntity(idx) {
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
    async createObjectEntity() {
      try {
        const response = await axios.post(this.link, this.form)
        this.getTable()
        this.allObjectOptions.push({
          value: response.data.id,
          label: response.data.name,
        })
        if (this.objectType === 'buildingType') {
          this.formBuildingType.object.id = response.data.id
          await this.createBuildingEntity()
          if (this.buildingType === 'residential') {
            this.formResidential.object.id = response.data.id
            await this.createResidentialEntity()
          }
          if (this.buildingType === 'nonresidential') {
            this.formNonresidential.object.id = response.data.id
            await this.createNonresidentialEntity()
          }
        }
        if (this.objectType === 'pathType') {
          this.formPathType.object.id = response.data.id
          await this.createPathEntity()
          if (this.pathType === 'bridge') {
            this.formBridge.object.id = response.data.id
            await this.createBridgeEntity()
          }
          if (this.pathType === 'road') {
            this.formRoad.object.id = response.data.id
            await this.createRoadEntity()
          }
        }

      } catch (e) {
        console.log(e);
      }
    },
    async createBuildingEntity() {
      try {
        await axios.post("/building_type", this.formBuildingType)
      } catch (e) {
        console.log(e);
      }
    },
    async createPathEntity() {
      try {
        await axios.post("/path_type", this.formPathType)
      } catch (e) {
        console.log(e);
      }
    },
    async createBridgeEntity() {
      try {
        await axios.post("/bridge", this.formBridge)
      } catch (e) {
        console.log(e);
      }
    },
    async createRoadEntity() {
      try {
        await axios.post("/road", this.formRoad)
      } catch (e) {
        console.log(e);
      }
    },
    async createResidentialEntity() {
      try {
        await axios.post("/residential", this.formResidential)
      } catch (e) {
        console.log(e);
      }
    },
    async createNonresidentialEntity() {
      try {
        await axios.post("/nonresidential", this.formNonresidential)
      } catch (e) {
        console.log(e);
      }
    }
  },
  setup() {
    const allObjectOptions = ref(objectIdParamOptions)
    const allSiteOptions = ref(siteIdParamOptions)
    const allObjectTypesOptions = ref(objectTypesParamOptions)
    const allBuildingTypesOptions = ref(buildingTypesParamOptions)
    const allPathTypesOptions = ref(pathTypesParamOptions)
    return {allSiteOptions, allObjectOptions, allObjectTypesOptions, allBuildingTypesOptions, allPathTypesOptions}
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