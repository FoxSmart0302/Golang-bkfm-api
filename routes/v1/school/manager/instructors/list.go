package instructors

import (
	"api/models"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"net/http"
	"strings"
)

func List(ctx *gin.Context) {

	db := ctx.MustGet("db").(*gorm.DB)
	// setup := ctx.MustGet("config").(*config.Config)
	domain := strings.Split(ctx.Request.Host, ":")[0]

	var school *models.School

	db.Model(&models.School{}).Where("domain = ?", domain).First(&school)

	if school == nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"status": http.StatusBadRequest,
		})
		return
	}

	var instructors []models.Instructor

	tx := db.Model(&models.Instructor{}).Where("school_id = ?", school.Id).Find(&instructors)

	if tx.Error != nil {
		ctx.JSON(http.StatusForbidden, gin.H{
			"status": http.StatusForbidden,
		})
		return
	}

	ctx.JSON(http.StatusOK, gin.H{
		"status": http.StatusOK,
		"data":   instructors,
	})
}
