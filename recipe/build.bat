@REM mkdir builddir

@REM %PYTHON% -m build -w -n -x ^
@REM     -Cbuilddir=builddir ^
@REM     -Csetup-args=-Dblas=blas ^
@REM     -Csetup-args=-Dlapack=lapack
@REM if %ERRORLEVEL% neq 0 exit 1

@REM :: `pip install dist\numpy*.whl` does not work on windows,
@REM :: so use a loop; there's only one wheel in dist/ anyway
@REM for /f %%f in ('dir /b /S .\dist') do (
@REM     pip install %%f
@REM     if %ERRORLEVEL% neq 0 exit 1
@REM )