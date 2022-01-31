using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace barberDLL.Migrations
{
    public partial class UserModelUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "password",
                table: "tUsers",
                type: "varchar(50)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "varchar(50)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "email",
                table: "tUsers",
                type: "varchar(100)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "varchar(100)",
                oldNullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "Existe",
                table: "tUsers",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "completeName",
                table: "tUsers",
                type: "varchar(100)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "isBarber",
                table: "tUsers",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "latitude",
                table: "tUsers",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "longitude",
                table: "tUsers",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "streetName",
                table: "tUsers",
                type: "varchar(200)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Existe",
                table: "tUsers");

            migrationBuilder.DropColumn(
                name: "completeName",
                table: "tUsers");

            migrationBuilder.DropColumn(
                name: "isBarber",
                table: "tUsers");

            migrationBuilder.DropColumn(
                name: "latitude",
                table: "tUsers");

            migrationBuilder.DropColumn(
                name: "longitude",
                table: "tUsers");

            migrationBuilder.DropColumn(
                name: "streetName",
                table: "tUsers");

            migrationBuilder.AlterColumn<string>(
                name: "password",
                table: "tUsers",
                type: "varchar(50)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(50)");

            migrationBuilder.AlterColumn<string>(
                name: "email",
                table: "tUsers",
                type: "varchar(100)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(100)");
        }
    }
}
