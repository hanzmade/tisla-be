<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\UserManagementController;
use App\Http\Controllers\Admin\ProgramStudyController;
use App\Http\Controllers\Admin\SyncronizeController;
use App\Http\Controllers\Admin\ManagementDataDosenController as DosenAdmin;
use App\Http\Controllers\Admin\ManagementDataMahasiswaController as MhsAdmin;
use App\Http\Controllers\Prodi\HomeProdiController;
use App\Http\Controllers\Prodi\HomeProdiDetailController;
use App\Http\Controllers\Prodi\ManagementDataDosenController;
use App\Http\Controllers\Prodi\ManagementDataMahasiswaController;
use App\Http\Controllers\Prodi\ManagementKurikulumController;
use App\Http\Controllers\Prodi\MataKuliahController;
use App\Http\Controllers\Prodi\AssessmentController;
use App\Http\Controllers\Prodi\CPLController;
use App\Http\Controllers\Prodi\CPMKController;
use App\Http\Controllers\Prodi\CompetenciesController;
use App\Http\Controllers\Prodi\MataKuliahDetailController;
use App\Http\Controllers\Prodi\HomeStandartDeviasiController;
use App\Http\Controllers\Prodi\MahasiswaDetailController;
use App\Http\Controllers\ForgetPasswordController;

Route::controller(AuthController::class)->group(function () {
    Route::post('login', 'login');
    Route::post('register', 'register');
    Route::post('logout', 'logout');
    Route::post('refresh', 'refresh');

});

// Forget Password
Route::controller(ForgetPasswordController::class)->group(function () {
    Route::post('forget-password', 'forgetPassword');
    Route::post('reset-password', 'resetPassword');
});


Route::controller(HomeController::class)->group(function () {
    Route::get('home', 'index')->middleware('myauth:admin');
    Route::get('detail-prodi', 'detailProgramStudy')->middleware('myauth:admin');
    Route::get('detail-mata-kuliah', 'detailMataKuliah')->middleware('myauth:admin');
});

Route::controller(UserManagementController::class)->group(function () {
    Route::get('user-management', 'index')->middleware('myauth:admin');
    Route::get('user-management-pre-insert', 'create')->middleware('myauth:admin');
    Route::post('user-management', 'insert')->middleware('myauth:admin');
    Route::get('user-management-pre-edit', 'edit')->middleware('myauth:admin');
    Route::put('user-management', 'update')->middleware('myauth:admin');
    Route::delete('user-management', 'destroy')->middleware('myauth:admin');
});

Route::controller(ProgramStudyController::class)->group(function () {
    Route::get('program-study', 'index')->middleware('myauth:admin');
    Route::post('program-study', 'insert')->middleware('myauth:admin');
    Route::get('program-study-pre-edit', 'edit')->middleware('myauth:admin');
    Route::put('program-study', 'update')->middleware('myauth:admin');
    Route::delete('program-study', 'destroy')->middleware('myauth:admin');
});

Route::controller(SyncronizeController::class)->group(function () {
    Route::post('upload-file', 'uploadFile')->middleware('myauth:admin');
    Route::post('render-file', 'render')->middleware('myauth:admin');
    Route::get('version-control-file', 'versionControlFile')->middleware('myauth:admin');
});

Route::controller(DosenAdmin::class)->group(function () {
    Route::get('admin-dosen', 'index')->middleware('myauth:admin');
});

Route::controller(MhsAdmin::class)->group(function () {
    Route::get('admin-mahasiswa', 'index')->middleware('myauth:admin');
});

Route::controller(HomeProdiController::class)->group(function () {
    Route::get('index', 'index')->middleware('myauth:prodi');
    Route::get('index-detail', 'indexDetail')->middleware('myauth:prodi');
    Route::get('index-table-data-assessment', 'tableDataAssessment')->middleware('myauth:prodi');
    Route::get('index-cw-cpmk', 'cwCpmkMap')->middleware('myauth:prodi');
    Route::get('index-cw-cpl', 'cwCplMap')->middleware('myauth:prodi');
    Route::get('index-chart-cpmk', 'indexChartCpmk')->middleware('myauth:prodi');
    Route::get('index-chart-cpl', 'indexChartCpl')->middleware('myauth:prodi');
    Route::get('index-chart-competencies', 'indexChartCompetencies')->middleware('myauth:prodi');
    Route::get('index-table-student-score', 'indexTableStudentScore')->middleware('myauth:prodi');
    Route::get('index-cpl-mark-by-cw', 'indexCplMarkByCW')->middleware('myauth:prodi');
    Route::get('index-cpmk-mark-by-cw', 'indexCpmkMarkByCW')->middleware('myauth:prodi');
    Route::get('index-grade-statistic', 'indexGradeStatistic')->middleware('myauth:prodi');
    Route::get('index-recap-assessment-by-competencies', 'indexRecapAssessmentByCompetencies')->middleware('myauth:prodi');
    Route::get('index-recap-assessment-by-competencies-statistic', 'indexRecapAssessmentByCompetenciesStatistic')->middleware('myauth:prodi');
    Route::get('index-recap-assessment-by-cpl-statistic', 'indexRecapAssessmentByCplStatistic')->middleware('myauth:prodi');
    // Route::get('index-recap-assessment-by-cpls', 'indexRecapAssessmentByCpls')->middleware('myauth:prodi');
    Route::get('index-student-mark-by-cpmk', 'indexStudentMarkByCpmk')->middleware('myauth:prodi');
    Route::get('index-student-mark-by-cpl', 'indexStudentMarkByCpl')->middleware('myauth:prodi');
    // Route::get('index-student-detail-chart-competencies', 'indexStudentDetailChartCompetencies')->middleware('myauth:prodi');
    Route::get('index-student-detail-chart-competencies-statistic', 'indexStudentDetailChartCompetenciesStatistic')->middleware('myauth:prodi');
    // Route::get('index-student-detail-chart-cpls', 'indexStudentDetailChartCpls')->middleware('myauth:prodi');
    Route::get('index-student-detail-chart-cpl-statistic', 'indexStudentDetailChartCplStatistic')->middleware('myauth:prodi');
    Route::get('index-cpl-mark-by-cw-detail', 'indexCplMarkByCwDetail')->middleware('myauth:prodi');
    Route::get('index-cpmk-mark-by-cw-detail', 'indexCpmkMarkByCwDetail')->middleware('myauth:prodi');
    Route::get('index-listing-question', 'indexListingQuestion')->middleware('myauth:prodi');
    Route::get('index-listing-standing-student', 'indexListingStandingStudent')->middleware('myauth:prodi');
    Route::get('index-listing-data-angkatan-mahasiswa', 'indexListingDataAngkatanMahasiswa')->middleware('myauth:prodi');
    Route::get('cpl-by-angkatan-mahasiswa', 'cplByAngkatanMahasiswa')->middleware('myauth:prodi');
    Route::post('delete-assessment', 'deleteAssessment')->middleware('myauth:prodi');

    // POST EVALUATION
    Route::post('submit-evaluation', 'submitEvaluation')->middleware('myauth:prodi');
});

Route::controller(HomeProdiDetailController::class)->group(function () {
    Route::get('index-prodi-dosen-detail', 'indexDosen')->middleware('myauth:prodi');
    Route::get('index-prodi-mahasiswa-detail', 'indexMahasiswa')->middleware('myauth:prodi');
    Route::get('index-prodi-mata-kuliah-detail', 'indexMataKuliah')->middleware('myauth:prodi');
});

Route::controller(HomeStandartDeviasiController::class)->group(function () {
    Route::get('index-prodi-standart-deviation', 'index')->middleware('myauth:prodi');
});

Route::controller(MahasiswaDetailController::class)->group(function () {
    Route::get('index-mahasiswa-detail', 'index')->middleware('myauth:prodi');
});

Route::controller(AssessmentController::class)->group(function () {
    Route::post('upload-file-assessmen', 'uploadFile')->middleware('myauth:prodi');
    Route::post('render-file-assessmen', 'render')->middleware(['myauth:prodi', 'cors']);
    Route::get('version-control-file-assessmen', 'versionControlFile')->middleware('myauth:prodi');
});

Route::controller(MataKuliahController::class)->group(function () {
    Route::post('upload-file-mata-kuliah', 'uploadFile')->middleware('myauth:prodi');
    Route::post('render-file-mata-kuliah', 'render')->middleware('myauth:prodi');
    Route::get('version-control-file-mata-kuliah', 'versionControlFile')->middleware('myauth:prodi');
    Route::get('mata-kuliah', 'index')->middleware('myauth:prodi');
    Route::post('mata-kuliah', 'insert')->middleware('myauth:prodi');
    Route::get('mata-kuliah-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('mata-kuliah', 'update')->middleware('myauth:prodi');
    Route::delete('mata-kuliah', 'destroy')->middleware('myauth:prodi');
});

Route::controller(MataKuliahDetailController::class)->group(function () {
    Route::get('index-mata-kuliah-detail', 'index')->middleware('myauth:prodi');
});

Route::controller(ManagementDataDosenController::class)->group(function () {
    Route::get('prodi-dosen', 'index')->middleware('myauth:prodi');
    Route::post('prodi-dosen', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-dosen-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::post('prodi-dosen-update', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-dosen', 'destroy')->middleware('myauth:prodi');
});

Route::controller(ManagementDataMahasiswaController::class)->group(function () {
    Route::get('prodi-mahasiswa', 'index')->middleware('myauth:prodi');
    Route::post('prodi-mahasiswa', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-mahasiswa-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('prodi-mahasiswa', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-mahasiswa', 'destroy')->middleware('myauth:prodi');
});

Route::controller(ManagementKurikulumController::class)->group(function () {
    Route::get('prodi-kurikulum', 'index')->middleware('myauth:prodi');
    Route::post('prodi-kurikulum', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-kurikulum-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('prodi-kurikulum', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-kurikulum', 'destroy')->middleware('myauth:prodi');
});

Route::controller(CPLController::class)->group(function () {
    Route::get('prodi-cpl', 'index')->middleware('myauth:prodi');
    Route::get('prodi-cpl-pre-insert', 'preInsert')->middleware('myauth:prodi');
    Route::post('prodi-cpl', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-cpl-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('prodi-cpl', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-cpl', 'destroy')->middleware('myauth:prodi');
});

Route::controller(CPMKController::class)->group(function () {
    Route::get('prodi-cpmk', 'index')->middleware('myauth:prodi');
    Route::get('prodi-cpmk-pre-insert', 'preInsert')->middleware('myauth:prodi');
    Route::post('prodi-cpmk', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-cpmk-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('prodi-cpmk', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-cpmk', 'destroy')->middleware('myauth:prodi');
});

Route::controller(CompetenciesController::class)->group(function () {
    Route::get('prodi-competencies', 'index')->middleware('myauth:prodi');
    Route::get('prodi-competencies-pre-insert', 'preInsert')->middleware('myauth:prodi');
    Route::post('prodi-competencies', 'insert')->middleware('myauth:prodi');
    Route::get('prodi-competencies-pre-edit', 'edit')->middleware('myauth:prodi');
    Route::put('prodi-competencies', 'update')->middleware('myauth:prodi');
    Route::delete('prodi-competencies', 'destroy')->middleware('myauth:prodi');
});
