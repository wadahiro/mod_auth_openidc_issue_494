# mod_auth_openidc_issue_494

This project is for reproducing [issue 494: segmentation fault on cache encryption](https://github.com/zmartzone/mod_auth_openidc/issues/494).

## How to reproduce

1. `git clone` this project
2. Build docker image

```
docker build . -t issue-494
```

3. Run the container

```
docker run --rm -it -p 1080:80 issue-494
```

4. Access with JWT access bearer token

```
curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJOZExha2F3NzlCZXN2a0cwMVVIS2xsT1I1THZkQnoydXAtcTRMN0xWcFlNIn0.eyJleHAiOjE2MDM3Njc2NDIsImlhdCI6MTYwMzc2NzM0MiwiYXV0aF90aW1lIjoxNjAzNzY1Njc3LCJqdGkiOiI2MTk5NjI5Mi02OGNjLTQxZGItYWNjMS1lOGRkN2RiZWQxNWUiLCJpc3MiOiJodHRwczovL2FzLmtleWNsb2FrLWZhcGkub3JnL2F1dGgvcmVhbG1zL3Rlc3QiLCJhdWQiOiJyZXNvdXJjZS1zZXJ2ZXIiLCJzdWIiOiIwYTE2NzQ1Zi00YTAzLTQ3MDQtOGIwZC1lYjY5ZjQwZmU4YzUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJjbGllbnQxLXByaXZhdGVfa2V5X2p3dC1QUzI1Ni1QUzI1NiIsIm5vbmNlIjoiWm5hNkR3WlFTayIsInNlc3Npb25fc3RhdGUiOiJjMzdlMjUzYi01OTNhLTQyMjctYmRmOC1mYTA5MmQ5NjRiMTMiLCJhY3IiOiIwIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTIuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9yZXZpZXctYXBwLWRldi1icmFuY2gtNy5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC04LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vd3d3LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTYuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9jb25mb3JtYW5jZS1zdWl0ZS5rZXljbG9hay1mYXBpLm9yZyIsImh0dHBzOi8vbG9jYWxob3N0LmVtb2JpeC5jby51ayIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTkuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9yZXZpZXctYXBwLWRldi1icmFuY2gtMS5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL2xvY2FsaG9zdC5lbW9iaXguY28udWs6ODQ0MyIsImh0dHBzOi8vc3RhZ2luZy5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC01LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTQuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9kZW1vLmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vbG9jYWxob3N0Ojg0NDMiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC0zLmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCJdLCJjbmYiOnsieDV0I1MyNTYiOiI3Z3J3VmNCUW1YMW9Id19VRlhtc1lleC1xdTlVRGhIZ3BGS01LNzZFZVg4In0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInByZWZlcnJlZF91c2VybmFtZSI6ImpvaG4ifQ.kyaazqnm6QD14nlBI5RcWD5XT7aLg2GqSkwc1zYFLX9xLE26yZPe71rjEv5T4t02-XqhMQBt7XyMDOT3CIYi3QpPklFMombWufnJfGXbYneMJvxCYS5Qg3UIPINbez95gIFzDdX3OFsW7GR1NhlNAkSHwkkMbK9Jf7EStialtLNN4IFUMo1PnReI1mdSyFH2icQrwQyeE8_eVsMOWS6TQK4gZwgcLdU-OXaZOF3rIWiKymW8s7xSqnuGZ2VXUXBGNrpF2SxKW0lB2En5bXCS8fis8MH3TTfPVs01lfEFlSlZyURtYiw-yqUQpVWFb7XHn39n3MLcc3yH1INw5gKNwA"  http://localhost:1080
```

Now, you can see the segmentation fault:

```
[Tue Oct 27 10:59:22.871486 2020] [auth_openidc:debug] [pid 10] src/oauth.c(392): [client 10.99.0.1:44010] oidc_oauth_cache_access_token: caching introspection result
[Tue Oct 27 10:59:22.871556 2020] [auth_openidc:debug] [pid 10] src/cache/common.c(640): [client 10.99.0.1:44010] oidc_cache_set: enter: eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJOZExha2F3NzlCZXN2a0cwMVVIS2xsT1I1THZkQnoydXAtcTRMN0xWcFlNIn0.eyJleHAiOjE2MDM3Njc2NDIsImlhdCI6MTYwMzc2NzM0MiwiYXV0aF90aW1lIjoxNjAzNzY1Njc3LCJqdGkiOiI2MTk5NjI5Mi02OGNjLTQxZGItYWNjMS1lOGRkN2RiZWQxNWUiLCJpc3MiOiJodHRwczovL2FzLmtleWNsb2FrLWZhcGkub3JnL2F1dGgvcmVhbG1zL3Rlc3QiLCJhdWQiOiJyZXNvdXJjZS1zZXJ2ZXIiLCJzdWIiOiIwYTE2NzQ1Zi00YTAzLTQ3MDQtOGIwZC1lYjY5ZjQwZmU4YzUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJjbGllbnQxLXByaXZhdGVfa2V5X2p3dC1QUzI1Ni1QUzI1NiIsIm5vbmNlIjoiWm5hNkR3WlFTayIsInNlc3Npb25fc3RhdGUiOiJjMzdlMjUzYi01OTNhLTQyMjctYmRmOC1mYTA5MmQ5NjRiMTMiLCJhY3IiOiIwIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTIuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9yZXZpZXctYXBwLWRldi1icmFuY2gtNy5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC04LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vd3d3LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTYuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9jb25mb3JtYW5jZS1zdWl0ZS5rZXljbG9hay1mYXBpLm9yZyIsImh0dHBzOi8vbG9jYWxob3N0LmVtb2JpeC5jby51ayIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTkuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9yZXZpZXctYXBwLWRldi1icmFuY2gtMS5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL2xvY2FsaG9zdC5lbW9iaXguY28udWs6ODQ0MyIsImh0dHBzOi8vc3RhZ2luZy5jZXJ0aWZpY2F0aW9uLm9wZW5pZC5uZXQiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC01LmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vcmV2aWV3LWFwcC1kZXYtYnJhbmNoLTQuY2VydGlmaWNhdGlvbi5vcGVuaWQubmV0IiwiaHR0cHM6Ly9kZW1vLmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCIsImh0dHBzOi8vbG9jYWxob3N0Ojg0NDMiLCJodHRwczovL3Jldmlldy1hcHAtZGV2LWJyYW5jaC0zLmNlcnRpZmljYXRpb24ub3BlbmlkLm5ldCJdLCJjbmYiOnsieDV0I1MyNTYiOiI3Z3J3VmNCUW1YMW9Id19VRlhtc1lleC1xdTlVRGhIZ3BGS01LNzZFZVg4In0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInByZWZlcnJlZF91c2VybmFtZSI6ImpvaG4ifQ.kyaazqnm6QD14nlBI5RcWD5XT7aLg2GqSkwc1zYFLX9xLE26yZPe71rjEv5T4t02-XqhMQBt7XyMDOT3CIYi3QpPklFMombWufnJfGXbYneMJvxCYS5Qg3UIPINbez95gIFzDdX3OFsW7GR1NhlNAkSHwkkMbK9Jf7EStialtLNN4IFUMo1PnReI1mdSyFH2icQrwQyeE8_eVsMOWS6TQK4gZwgcLdU-OXaZOF3rIWiKymW8s7xSqnuGZ2VXUXBGNrpF2SxKW0lB2En5bXCS8fis8MH3TTfPVs01lfEFlSlZyURtYiw-yqUQpVWFb7XHn39n3MLcc3yH1INw5gKNwA (section=a, len=36, encrypt=1, ttl(s)=-1603796362, type=shm)
[Tue Oct 27 10:59:23.529866 2020] [core:notice] [pid 1] AH00052: child pid 10 exit signal Segmentation fault (11)
[Tue Oct 27 11:00:08.246085 2020] [core:info] [pid 1] AH00096: removed PID file /run/apache2/httpd.pid (pid=1)
[Tue Oct 27 11:00:08.246146 2020] [mpm_prefork:notice] [pid 1] AH00169: caught SIGTERM, shutting down
[Tue Oct 27 11:00:08.256393 2020] [auth_openidc:info] [pid 1] mod_auth_openidc-2.4.5rc1fapi - shutdown
```