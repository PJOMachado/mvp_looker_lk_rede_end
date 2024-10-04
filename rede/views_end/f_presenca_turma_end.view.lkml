view: f_presenca_turma_end {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fPresenca_Turma` ;;

  dimension: cod_turma {
    type: number
    sql: ${TABLE}.CodTurma ;;
  }
  dimension: med {
    type: number
    sql: ${TABLE}.Med ;;
  }
  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.CodTurma,${TABLE}.SemanaAno) ;;
  }
  measure: presenca {
    type: number
    sql: case
            when avg(${TABLE}.Med) = 0
            then 0
         else avg(${TABLE}.Med) / 100
        end ;;
  }
  measure: count {
    type: count
  }
}
