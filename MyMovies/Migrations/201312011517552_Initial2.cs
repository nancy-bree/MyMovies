namespace MyMovies.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Movies", "Title", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Movies", "Title", c => c.Int(nullable: false));
        }
    }
}
