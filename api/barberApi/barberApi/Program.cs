var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
var app = builder.Build();
app.MapControllerRoute(name: "user",
               pattern: "user/");

app.UseHttpsRedirection();

app.Run();
