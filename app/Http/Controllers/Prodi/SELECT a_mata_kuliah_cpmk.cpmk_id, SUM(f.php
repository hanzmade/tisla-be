SELECT a_mata_kuliah_cpl.cpl_id, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight)) * 100 / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate100, SUM(float4(a_cw_question_mhs.weight) / float4(a_cw_question_cpl.weight) * 4) / COUNT(a_cw_question_cpl.a_mata_kuliah_cpl_id) as dataCplRate4
-- SELECT m_cpl.id, m_cpl.name, a_cw_question_mhs.weight as mhsweight, a_cw_question_cpl.weight as cplweight, 
--         a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id, m_course_works.name as cwname, m_questions.name as qname
FROM a_mata_kuliah
JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
JOIN a_cw_question_mhs ON a_mata_kuliah_mahasiswa.id = a_cw_question_mhs.a_mata_kuliah_mahasiswa_id
JOIN a_cw_question_cpl ON a_cw_question_mhs.a_cw_question_id = a_cw_question_cpl.a_cw_question_id
JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
LEFT JOIN (
    SELECT a_mata_kuliah_cpl.*
    FROM a_mata_kuliah_cpl
    JOIN a_mata_kuliah ON a_mata_kuliah_cpl.a_mata_kuliah_id = a_mata_kuliah.id
    JOIN a_mata_kuliah_mahasiswa ON a_mata_kuliah.id = a_mata_kuliah_mahasiswa.a_mata_kuliah_id
    JOIN a_mahasiswa_program_studies ON a_mata_kuliah_mahasiswa.a_mahasiswa_program_study_id = a_mahasiswa_program_studies.id
    WHERE a_mata_kuliah.unique_code = '$2y$10$h7QA8a3BAv8ATzeZBqEbjeWmlhmUfsL.Vz8e4rI9s9NCiS90..JZ6'
    AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%41419010005%'
)a_mata_kuliah_cpl ON a_cw_question_cpl.a_mata_kuliah_cpl_id = a_mata_kuliah_cpl.id
JOIN m_cpl ON a_mata_kuliah_cpl.cpl_id = m_cpl.id
JOIN a_course_work_questions ON a_cw_question_cpl.a_cw_question_id = a_course_work_questions.id
JOIN m_course_works ON a_course_work_questions.course_work_id = m_course_works.id
JOIN m_questions ON a_course_work_questions.question_id = m_questions.id
WHERE a_mata_kuliah.unique_code = '$2y$10$h7QA8a3BAv8ATzeZBqEbjeWmlhmUfsL.Vz8e4rI9s9NCiS90..JZ6'
AND a_mahasiswa_program_studies.m_mahasiswa_nim LIKE '%41419010005%'
GROUP BY a_mata_kuliah_cpl.cpl_id;