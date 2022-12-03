SELECT id, cpl_id, dataCplRate100, dataCplRate4
FROM (
    SELECT a_mata_kuliah.id, a_mata_kuliah_cpl.cpl_id, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
    FROM a_mata_kuliah
    JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
    JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
    JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
    LEFT JOIN (
        SELECT a_mata_kuliah_cpl.*
        FROM a_mata_kuliah_cpl
        JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
        WHERE a_mata_kuliah.unique_code IN ('$2y$10$WsMl8Mnxffiz9axQSWzuKujdx3HjEgii0DcpKdmkIL/W798.vff8e')
    )a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
    JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id 
    JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
    JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
    JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
    WHERE a_mata_kuliah.unique_code IN ('$2y$10$WsMl8Mnxffiz9axQSWzuKujdx3HjEgii0DcpKdmkIL/W798.vff8e')
    GROUP BY a_mata_kuliah.id, a_mata_kuliah_cpl.cpl_id
) main
