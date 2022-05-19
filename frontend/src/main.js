import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'
import "./axios";
import {createRouter, createWebHashHistory} from "vue-router";
import tables from "@/data/tables";
import InformationPage from "@/components/InformationPage";
import QueriesPage from "@/components/QueriesPage";
import HomePage from "@/components/HomePage";
import queries from "@/data/queries";

const app = createApp(App)

const router = createRouter({
    history: createWebHashHistory(),
    routes:
        tables.concat(
        queries.concat([
        {
            name: "Home Page",
            path: "/",
            component: HomePage
        },
        {
            name: "Information Page",
            path: '/info',
            component: InformationPage
        },
        {
            name: "Queries Page",
            path: '/queries',
            component: QueriesPage
        }
    ]))
})

app.use(ElementPlus)
app.use(router)
app.mount('#app')