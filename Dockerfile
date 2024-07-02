FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /FooBar_core_01


# Copy everything to docker image
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /FooBar_core_01
COPY --from=build-env /FooBar_core_01/out .
ENTRYPOINT ["dotnet", "FooBar_core_01.dll"]
# jesli chcesz przekazać parametry do metody Main
# CMD ["-sampple_par_name", "parameter_value"] 
#
# jeśli będziesz miał zmienne środowiskowe, które chesz przekazać do obrazu:
#ENV MY_FOOBAR_ENV_DEMO="TO BE INJECTED INTO CONTAINER"
