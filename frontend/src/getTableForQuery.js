import axios from "axios";

function toCapitalizedWords(name) {
    const words = name.match(/[A-Za-z][a-z]*/g) || [];

    return words.map(capitalize).join(" ");
}

function capitalize(word) {
    return word.charAt(0).toUpperCase() + word.substring(1);
}

export async function getTableForQuery(link, params) {
    try {
        const response = await axios.get(link, {params: params})
        let rows = response.data
        let columns = []
        for (const key in rows[0]) {
            let obj = {field: key, headerName: toCapitalizedWords(key)}
            columns.push(obj);
        }
        return {columns, rows}
    } catch (e) {
        console.log(e);
    }
}