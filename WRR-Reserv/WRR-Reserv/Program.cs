using System.Data;
using System.Data.SqlClient;
using WRR_Reserv.Components;
using WRR_Reserv.Models;
using WRR_Reserv.Services;
using WRRManagement.Domain.Amenities;
using WRRManagement.Infrastructure.AmenityRepository;
using WRRManagement.Infrastructure.Data;

var builder = WebApplication.CreateBuilder(args);

// Add HttpClient
builder.Services.AddHttpClient("WRRApiClient", client =>
{
    client.BaseAddress = new Uri("https://localhost:44325"); // API Base URL
    client.DefaultRequestHeaders.Add("Accept", "application/json");
});


builder.Services.AddScoped<AmenityCartService>();
builder.Services.AddScoped<RoomService>();
builder.Services.AddScoped<BookService>();
builder.Services.AddScoped<AddonService>();
builder.Services.AddScoped<WRRContext>();
builder.Services.AddScoped<IExtraAmenity, AmenityRepository>();

//registering models
builder.Services.AddSingleton<SelectedAmenityModel>();
builder.Services.AddSingleton<SearchModel>();
builder.Services.AddSingleton<BookingModel>();
builder.Services.AddSingleton<AmenityModel>();
builder.Services.AddSingleton<ErrorState>();

builder.Services.AddLogging(logging =>
{
    logging.SetMinimumLevel(LogLevel.Information);
    logging.AddConsole();
});

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents()
    .AddInteractiveWebAssemblyComponents();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode()
    .AddInteractiveWebAssemblyRenderMode();
   

app.Run();
