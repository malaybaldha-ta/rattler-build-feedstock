@echo on
:: Set up the MSVC environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

:: Create build directory
mkdir builddir

:: Build the wheel
%PYTHON% -m build -w -n -x ^
    -Cbuilddir=builddir ^
    -Csetup-args=-Dblas=blas ^
    -Csetup-args=-Dlapack=lapack
if %ERRORLEVEL% neq 0 exit 1

:: Install the built wheel (workaround for Windows)
for /f %%f in ('dir /b /S .\dist') do (
    pip install %%f
    if %ERRORLEVEL% neq 0 exit 1
)
