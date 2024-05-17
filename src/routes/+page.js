import Papa from 'papaparse';

export const load = async({fetch}) => {
    const responsePur = await fetch('https://raw.githubusercontent.com/JannesPeeters/suncharge/main/data/Purchases.csv',
        {
            headers: {
                'Content-Type': 'text/csv'
            }
        }
    )

    let csvPur = await responsePur.text()
    let parsedPur = Papa.parse(csvPur, {header:true})

    return{
        Purchases: parsedPur.data
    }
}