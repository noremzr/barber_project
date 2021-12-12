using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace barberDLL.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "tUsers",
                columns: table => new
                {
                    userName = table.Column<string>(type: "varchar(50)", nullable: false),
                    password = table.Column<string>(type: "varchar(50)", nullable: true),
                    email = table.Column<string>(type: "varchar(100)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tUsers", x => x.userName);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "tUsers");
        }
    }
}
