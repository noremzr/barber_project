using Microsoft.AspNetCore.Builder;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllersWithViews();
var app = builder.Build();
app.UseSwagger();
app.MapGet("/", () => "Hello World!");

app.UseRouting();
app.MapControllerRoute(
    name: "user",
    pattern: "{controller=User}/{action=Index}");
app.UseSwaggerUI();
app.Run();