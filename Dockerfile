FROM  mcr.microsoft.com/dotnet/core/sdk AS build
WORKDIR /src

COPY *.csproj ./

RUN dotnet restore
COPY . .

RUN dotnet publish -c Release -o /out

FROM mcr.microsoft.com/dotnet/core/aspnet AS runtime
WORKDIR /out
COPY --from=build /out .
CMD ["dotnet", "BooksApi.dll"]