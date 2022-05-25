import BridgeTable from "@/components/Tables/BridgeTable";
import BrigadeTable from "@/components/Tables/BrigadeTable";
import BuildingTypeTable from "@/components/Tables/BuildingTypeTable";
import ContractTable from "@/components/Tables/ContractTable";
import EmployerTable from "@/components/Tables/EmployerTable";
import EngineerTechnicalStaffTable from "@/components/Tables/EngineerTechnicalStaffTable";
import EquipmentTable from "@/components/Tables/EquipmentTable";
import EstimateTable from "@/components/Tables/EstimateTable";
import LabourTable from "@/components/Tables/LabourTable";
import ManagementTable from "@/components/Tables/ManagementTable";
import MaterialTable from "@/components/Tables/MaterialTable";
import NonresidentialTable from "@/components/Tables/NonresidentialTable";
import ObjectTable from "@/components/Tables/ObjectTable";
import OrganisationTable from "@/components/Tables/OrganisationTable";
import PathTypeTable from "@/components/Tables/PathTypeTable";
import ResidentialTable from "@/components/Tables/ResidentialTable";
import RoadTable from "@/components/Tables/RoadTable";
import ScheduleTable from "@/components/Tables/ScheduleTable";
import SiteTable from "@/components/Tables/SiteTable";
import WorkerTable from "@/components/Tables/WorkerTable";
import WorkTypeByBrigadeTable from "@/components/Tables/WorkTypeByBrigadeTable";
import WorkTypeTable from "@/components/Tables/WorkTypeTable";


const tables = [
    {
        id: 1,
        name: "Bridge",
        path: "/bridge",
        component: BridgeTable,
        props: true
    },
    {
        id: 2,
        name: "Brigade",
        path: "/brigade",
        component: BrigadeTable,
        props: true
    },
    {
        id: 3,
        name: "Building Type",
        path: "/building_type",
        component: BuildingTypeTable,
        props: true
    },
    {
        id: 4,
        name: "Contract",
        path: "/contract",
        component: ContractTable,
        props: true
    },
    {
        id: 5,
        name: "Employer",
        path: "/employer",
        component: EmployerTable,
        props: true
    },
    {
        id: 6,
        name: "Engineer Technical Staff",
        path: "/engineer_tech_staff",
        component: EngineerTechnicalStaffTable,
        props: true
    },
    {
        id: 7,
        name: "Equipment",
        path: "/equipment",
        component: EquipmentTable,
        props: true
    },
    {
        id: 8,
        name: "Estimate",
        path: "/estimate",
        component: EstimateTable,
        props: true
    },
    {
        id: 9,
        name: "Labour",
        path: "/labour",
        component: LabourTable,
        props: true
    },
    {
        id: 10,
        name: "Management",
        path: "/management",
        component: ManagementTable,
        props: true
    },
    {
        id: 11,
        name: "Material",
        path: "/material",
        component: MaterialTable,
        props: true
    },
    {
        id: 12,
        name: "Nonresidential",
        path: "/nonresidential",
        component: NonresidentialTable,
        props: true
    },
    {
        id: 13,
        name: "Object",
        path: "/object",
        component: ObjectTable,
        props: true
    },
    {
        id: 14,
        name: "Organisation",
        path: "/organisation",
        component: OrganisationTable,
        props: true
    },
    {
        id: 15,
        name: "Path Type",
        path: "/path_type",
        component: PathTypeTable,
        props: true
    },
    {
        id: 16,
        name: "Residential",
        path: "/residential",
        component: ResidentialTable,
        props: true
    },
    {
        id: 17,
        name: "Road",
        path: "/road",
        component: RoadTable,
        props: true
    },
    {
        id: 18,
        name: "Schedule",
        path: "/schedule",
        component: ScheduleTable,
        props: true
    },
    {
        id: 19,
        name: "Site",
        path: "/site",
        component: SiteTable,
        props: true
    },
    {
        id: 20,
        name: "Worker",
        path: "/worker",
        component: WorkerTable,
        props: true
    },
    {
        id: 21,
        name: "Worktype By Brigade",
        path: "/work_type_by_brigade",
        component: WorkTypeByBrigadeTable,
        props: true
    },
    {
        id: 22,
        name: "Worktype",
        path: "/work_type",
        component: WorkTypeTable,
        props: true
    }
]

export default tables;