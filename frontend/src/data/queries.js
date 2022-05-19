import ManagementListQuery from "@/components/Queries/ManagementListQuery";
import EngineerTechStaffListQuery from "@/components/Queries/EngineerTechStaffListQuery";
import ObjectListQuery from "@/components/Queries/ObjectListQuery";
import BrigadeListQuery from "@/components/Queries/BrigadeListQuery";
import EquipmentListQuery from "@/components/Queries/EquipmentListQuery";
import EquipmentOnObjectListQuery from "@/components/Queries/EquipmentOnObjectListQuery";
import ScheduleAndEstimateListQuery from "@/components/Queries/ScheduleAndEstimateListQuery";
import ReportListQuery from "@/components/Queries/ReportListQuery";
import ObjectWorkTypeListQuery from "@/components/Queries/ObjectWorkTypeListQuery";
import WorkTypeOverDeadlineListQuery from "@/components/Queries/WorkTypeOverDeadlineListQuery";
import MaterialOverEstimateListQuery from "@/components/Queries/MaterialOverEstimateListQuery";
import WorkTypeByBrigadeInPeriodListQuery from "@/components/Queries/WorkTypeByBrigadeInPeriodListQuery";
import BrigadeByWorkTypeInPeriodListQuery from "@/components/Queries/BrigadeByWorkTypeInPeriodListQuery";

const queries = [
    {
        id: 1,
        name: "Management List",
        path: "/management/list",
        component: ManagementListQuery,
        props: true
    },
    {
        id: 2,
        name: "Engineer Technical Staff List",
        path: "/engineer_tech_staff/list",
        component: EngineerTechStaffListQuery,
        props: true
    },
    {
        id: 3,
        name: "Object List",
        path: "/object/list",
        component: ObjectListQuery,
        props: true
    },
    {
        id: 4,
        name: "Brigade List",
        path: "/brigade/list",
        component: BrigadeListQuery,
        props: true
    },
    {
        id: 5,
        name: "Equipment List",
        path: "/equipment/list",
        component: EquipmentListQuery,
        props: true
    },
    {
        id: 6,
        name: "Equipment On Object List",
        path: "/equipment/on_objects",
        component: EquipmentOnObjectListQuery,
        props: true
    },
    {
        id: 7,
        name: "Schedule And Estimate List",
        path: "/object/schedule_and_estimate",
        component: ScheduleAndEstimateListQuery,
        props: true
    },
    {
        id: 8,
        name: "Report List",
        path: "/object/report",
        component: ReportListQuery,
        props: true
    },
    {
        id: 9,
        name: "Object By Work Type List",
        path: "/object/work_type",
        component: ObjectWorkTypeListQuery,
        props: true
    }
    ,
    {
        id: 10,
        name: "Work Type Over Deadline List",
        path: "/work_type/over_deadline",
        component: WorkTypeOverDeadlineListQuery,
        props: true
    },
    {
        id: 11,
        name: "Material Over Estimate List",
        path: "/material/over_estimate",
        component: MaterialOverEstimateListQuery,
        props: true
    },
    {
        id: 12,
        name: "Work Type By Brigade In Period List",
        path: "/work_type_by_brigade/in_period",
        component: WorkTypeByBrigadeInPeriodListQuery,
        props: true
    },
    {
        id: 13,
        name: "Brigade By Work Type In Period List",
        path: "/brigade/in_period",
        component: BrigadeByWorkTypeInPeriodListQuery,
        props: true
    }
]

export default queries;