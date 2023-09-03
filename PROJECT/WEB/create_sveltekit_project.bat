@echo select Skeleton, TypeScript, ESLint
call npm create svelte@latest fluent-project
rename fluent-project CODE
cd CODE
call npm install --global yarn
call yarn install
call yarn add senselogic-flow senselogic-gist @supabase/supabase-js
call yarn audit
pause
