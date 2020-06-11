<?php

namespace App\Entity;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * Articles
 * @ORM\Table(name="articles")
 * @ORM\Entity
 * @ApiResource
 */

class Articles
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
     * @var bool
     *
     * @ORM\Column(name="actif", type="boolean", nullable=false, options={"default"="1"})
     */
    private $actif = true;

    /**
     * @var float
     *
     * @ORM\Column(name="prix", type="float", precision=10, scale=0, nullable=false)
     */
    private $prix;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=128, nullable=false)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=false)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $primary_image;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Images", mappedBy="id_articles")
     */
    private $images;

    /**
     * @ORM\Column(type="integer")
     */
    private $Quantit;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getActif(): ?bool
    {
        return $this->actif;
    }

    public function setActif(bool $actif): self
    {
        $this->actif = $actif;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->prix;
    }

    public function setPrix(float $prix): self
    {
        $this->prix = $prix;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

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

    /**
     * @return Collection|images[]
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(images $image): self
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
            $image->setIdArticles($this);
        }

        return $this;
    }

    public function removeImage(images $image): self
    {
        if ($this->images->contains($image)) {
            $this->images->removeElement($image);
            // set the owning side to null (unless already changed)
            if ($image->getIdArticles() === $this) {
                $image->setIdArticles(null);
            }
        }

        return $this;
    }

    public function getQuantit(): ?int
    {
        return $this->Quantit;
    }

    public function setQuantit(int $Quantit): self
    {
        $this->Quantit = $Quantit;

        return $this;
    }


}
