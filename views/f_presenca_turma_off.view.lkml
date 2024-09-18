view: f_presenca_turma_off {
  sql_table_name: `Datalake.fPresenca_Turma` ;;

  dimension: cgm {
    type: string
    sql: ${TABLE}.Cgm ;;
  }
  dimension: cod_mec {
    type: number
    sql: ${TABLE}.CodMec ;;
  }
  dimension: cod_turma {
    type: number
    sql: ${TABLE}.CodTurma ;;
  }
  dimension: copy_sunday {
    type: yesno
    sql: ${TABLE}.CopySunday ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.CreatedAt ;;
  }
  dimension_group: data_aula {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.DataAula ;;
  }
  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }
  dimension: num_matricula {
    type: number
    sql: ${TABLE}.NumMatricula ;;
  }
  dimension: periodo_letivo {
    type: string
    sql: ${TABLE}.PeriodoLetivo ;;
  }
  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }
  dimension: total_aulas {
    type: number
    sql: ${TABLE}.TotalAulas ;;
  }
  dimension: total_faltas {
    type: number
    sql: ${TABLE}.TotalFaltas ;;
  }
  dimension: total_presenca {
    type: number
    sql: ${TABLE}.TotalPresenca ;;
  }
  measure: count {
    type: count
  }
}
