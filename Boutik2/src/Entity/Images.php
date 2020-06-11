<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
/**
 * Images
 *
 * @ORM\Table(name="images")
 * @ORM\Entity
 * @ApiResource()
 */
class Images
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="url", type="string", length=128, nullable=false)
     */
    private $url;

    /**
     * @var int|null
     *
     * @ORM\Column(name="id_user", type="integer", nullable=true)
     */
    private $idUser;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $primary_image;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Articles", inversedBy="images")
     * @ORM\JoinColumn(nullable=false)
     */
    private $id_articles;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUrl(): ?string
    {
        return $this->url;
    }

    public function setUrl(string $url): self
    {
        $this->url = $url;

        return $this;
    }

    public function getIdUser(): ?int
    {
        return $this->idUser;
    }

    public function setIdUser(?int $idUser): self
    {
        $this->idUser = $idUser;

        return $this;
    }

    public function getPrimaryImage(): ?string
    {
        return $this->primary_image;
    }

    public function setPrimaryImage(string $primary_image): self
    {
        $this->primary_image = $primary_image;

        return $this;
    }

    public function getIdArticles(): ?Articles
    {
        return $this->id_articles;
    }

    public function setIdArticles(?Articles $id_articles): self
    {
        $this->id_articles = $id_articles;

        return $this;
    }


}
