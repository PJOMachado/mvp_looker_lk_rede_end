view: d_calendario {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dCalendario` ;;

  dimension: ano {
    type: number
    sql: ${TABLE}.ANO ;;
  }
  dimension_group: data {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATA ;;
  }
  dimension: dia_semana {
    type: number
    sql: ${TABLE}.DIA_SEMANA ;;
  }
  dimension: nome_dia_semana {
    type: string
    sql: ${TABLE}.NOME_DIA_SEMANA ;;
  }
  dimension: nome_mes {
    type: string
    sql: ${TABLE}.NOME_MES ;;
  }
  dimension: num_mes {
    type: number
    sql: ${TABLE}.NUM_MES ;;
  }
  dimension_group: referencia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.REFERENCIA ;;
  }
  dimension: semana_ano_letiva {
    type: number
    sql: ${TABLE}.SEMANA_ANO_LETIVA ;;
  }
  dimension: semana_do_ano {
    type: number
    sql: ${TABLE}.SEMANA_DO_ANO ;;
  }
  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }
  dimension: semana_se {
    type: string
    sql: ${TABLE}.SEMANA_SE ;;
  }
  dimension: semestre {
    type: string
    sql: ${TABLE}.SEMESTRE ;;
  }
  dimension: trimestre {
    type: number
    sql: ${TABLE}.TRIMESTRE ;;
  }
  dimension: trimestre_periodo {
    type: string
    sql: ${TABLE}.TRIMESTRE_PERIODO ;;
  }
  measure: count {
    type: count
  }
}
